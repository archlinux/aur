# Maintainer: Gregoire Lodi <gregoire.lodi@gmail.com>

pkgname=wafw00f
pkgver=0.9.4
pkgrel=1
pkgdesc="Web Application Firewall Detection Tool"
arch=("i686" "x86_64")
url="https://github.com/EnableSecurity/wafw00f"
license=("GPL")
makedepends=("python3")
source=("$pkgname"::"git+${url}.git")
noextract=()
md5sums=("SKIP")

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
