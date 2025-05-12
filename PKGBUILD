pkgname=zhongtaiko_filter_py
pkgver=1.0.0
pkgrel=1
pkgdesc="Filters ghost key events from ZhongTaiko [Pro] drum controllers using a root-run systemd service"
arch=('any')
url="https://github.com/zDEFz/${pkgname}"
license=('MIT')
depends=('python' 'python-evdev')
makedepends=('git')
install="${pkgname}.install"
source=("git+https://github.com/zDEFz/${pkgname}.git")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}"
  
  # Install the Python script
  install -Dm755 "${pkgname}.py" \
    "${pkgdir}/usr/lib/${pkgname}/${pkgname}.py"
  
  # Install the systemd service file
  install -Dm644 "${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  
  # Install documentation & license
  install -Dm644 "README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
