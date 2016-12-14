pkgname=pyq9-git
_pkgname=PyQ9
pkgver=r52.1ca7688
pkgrel=1
pkgdesc="Chinese IME in testing."
arch=('i686' 'x86_64')
url="https://gitlab.com/Saren/PyQ9"
depends=('xdotool' 'python-pillow' 'python-xlib' 'tk')
source=('git+https://gitlab.com/Saren/PyQ9.git' 'icon.png' 'pyq9.desktop')
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p ${pkgdir}/opt/${_pkgname}
  install -Dm644 "icon.png" "${pkgdir}/opt/${_pkgname}/icon.png"
  install -Dm644 "pyq9.desktop" "${pkgdir}/usr/share/applications/pyq9.desktop"
  cd "${_pkgname}"
  install -Dm755 "main.py" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
  install -Dm644 "pyxhook.py" "${pkgdir}/opt/${_pkgname}/pyxhook.py"
  cp -r assets "${pkgdir}/opt/${_pkgname}"
}
