# Maintainer: Zhang Hua <zhanghuadedn@gmail.com>
# Contributer: Aloxaf <aloxafx@gmail.com>

pkgname=python-playwright-git
pkgver=ea7857e
pkgrel=1
pkgdesc="a Python library to automate Chromium, Firefox and WebKit browsers with a single API"
arch=(x86_64 aarch64)
url=https://github.com/microsoft/playwright-python
license=(Apache)
provides=(python-playwright)
makedepends=('python-pip' 'python-wheel' 'git')
depends=('python' 'python-greenlet' 'python-pyee' 'python-typing_extensions')
source=(${pkgname}::git+${url})
sha256sums=('SKIP')
pkgver() {
  cd ${srcdir}/${pkgname}
  git rev-parse --short HEAD
}
package() {
  cd ${srcdir}/${pkgname}
  pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location ${srcdir}/${pkgname}
  python -O -m compileall "${pkgdir}"
}
