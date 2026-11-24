# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=holdspeak
pkgver=0.4.0
pkgrel=1
pkgdesc="Local push-to-talk voice typing and meeting transcription"
arch=('any')
url="https://github.com/karolswdev/holdspeak"
license=('Apache-2.0')
depends=('python' 'python-fastapi' 'python-faster-whisper' 'python-multipart' 'python-numpy' 'python-pydantic' 'python-pynput' 'python-pyperclip' 'python-sounddevice' 'python-yaml' 'uvicorn')
optdepends=(
  'python-gobject: desktop presence indicator'
  'libayatana-appindicator: tray icon'
  'libnotify: desktop notifications'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/h/holdspeak/holdspeak-${pkgver}.tar.gz")
sha256sums=('dd1607680a4b25cc4c4343751b729e4cde9ccbcef54f0d96c78f2d449ed75a3e')

build() {
  cd "holdspeak-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "holdspeak-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
