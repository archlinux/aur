# Maintainer: nous at artixlinux org
# Contributor: sputnick <gilles DOT quenot AT gmail DOT com>
pkgname=sysrqd
pkgver=17
pkgrel=1
pkgdesc="A small daemon intended to manage Linux SysRq over network"
arch=('i686' 'x86_64')
url="http://julien.danjou.info/software/$pkgname"
license=("GPL")
install="${pkgname}.install"
conflicts=('sysrqd-git')
provides=("sysrqd=v${pkgver}")

#_gitroot="$_pkgname::git+https://github.com/jd/sysrqd"
#_gitname=$pkgname

source=( "$pkgname::git+https://github.com/jd/sysrqd.git" )
md5sums=('SKIP')
sha256sums=('SKIP')


build() {
  cd $pkgname
  make
}

###

pkgver() {
    cd ${srcdir}/${pkgname}
#    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
    git describe | sed 's/v//'
}

package() {
   cd ${srcdir}/${pkgname}
   install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
