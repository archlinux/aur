# Maintainer: Ward Segers <w@rdsegers.be>

_cranver=0.4-26
pkgname=r-proxy
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='An extensible framework for auto- and cross-proximities'
arch=('x86_64')
url='https://cran.r-project.org/web/packages/proxy'
license=('GPL')
depends=('r')
source=("https://cran.r-project.org/src/contrib/proxy_"$_cranver".tar.gz")
sha512sums=('227a284e3d44be6246adad0212136b716cf4ef1769f470c7e1521f4a5cdf5427edbc5875e9b01f1635a8ee4ede76676f6dd4bbbfdeb478a429a41bf068947a4b')

build(){
    R CMD INSTALL proxy_"$_cranver".tar.gz -l "$srcdir"
}

package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership proxy "$pkgdir"/usr/lib/R/library
}


