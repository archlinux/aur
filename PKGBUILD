# Contributor: sputnick <gilles DOT quenot AT gmail DOT com>
pkgname=sysrqd
pkgver=v14.r0.ge9479f8
pkgrel=1
pkgdesc="A small daemon intended to manage Linux Sysrq over network."
arch=('i686' 'x86_64')
url="http://julien.danjou.info/software/$pkgname"
license="GPL"
install="${pkgname}.install"
conflicts=('sysrqd')
provides=('sysrqd')

#_gitroot="$_pkgname::git+https://github.com/jd/sysrqd"
#_gitname=$pkgname

source=( "$pkgname::git+https://github.com/jd/sysrqd.git" )
md5sums=('SKIP')


build() {
  cd $pkgname
  make
}

###
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
   cd ${srcdir}/${pkgname}
   install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

