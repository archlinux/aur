# Maintainer: Carson Rueter <bottomtext97@gmail.com>
pkgname='cmdtools-git'
reponame='cmdtools'
pkgver=1.0.0.r4.gc85fe99
pkgrel=1
pkgdesc="Tools to manipulate, create, and view commands."
arch=('any')
url="https://github.com/binex-dsk/cmdtools"
license=('GPL3')
source=("git+https://github.com/binex-dsk/cmdtools.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$reponame
  git describe --tags | sed 's/-/.r/;s/-/./'
}

package() {
        for i in `ls $srcdir/$reponame/src`; do
	    echo $i
	    install -Dm755 "$srcdir/$reponame/src/$i" "${pkgdir}/usr/bin/$i"
        done
}
