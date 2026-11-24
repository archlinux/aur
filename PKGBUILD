# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hns
pkgver=1.1.0
pkgrel=1
pkgdesc="Speech-to-text CLI that transcribes your microphone to the clipboard"
arch=('any')
url="https://github.com/primaprashant/hns"
license=('MIT')
depends=('python' 'python-click' 'python-faster-whisper' 'python-numpy' 'python-pyperclip' 'python-requests' 'python-rich' 'python-sounddevice')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/h/hns/hns-${pkgver}.tar.gz")
sha256sums=('bedd02ecbe0759fc947676a3f4945332920093ed0304237f082dced2c8c6b986')

build() {
  cd "hns-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "hns-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
