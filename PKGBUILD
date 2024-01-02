# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=argos-translate-gui
_name=argostranslategui
pkgver=1.6.5
pkgrel=2
pkgdesc="Graphical user interface for Argos Translate"
arch=('any')
url="https://www.argosopentech.com"
license=('MIT')
depends=('argos-translate' 'python-pyqt5')
makedepends=('git' 'python-installer')
_commit=588e128e7665e0118f6e36b39cec265464c6e71f  # 1.6.5
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl"
        "https://raw.githubusercontent.com/argosopentech/argos-translate-gui/$_commit/LICENSE"
        'argos-translate.desktop'
        'argos-translate.png')
sha256sums=('18ff453a55617ad3bafb39c263e65e821710b8e75f1d12a2c4e0d011f3544641'
            '7c5d4a497b63457497d7f0652e8fb063b751b4f9f3a35ac58b010aad0698d7eb'
            'e0b55ff51c34d8b170aa7b459efc1d69931a2726d7bc8d2cf8c09c916489f3e3'
            '634c076d02a175109d4190aa9b816fedf4ec25b0985a4c1eeafc730dece69e65')

package() {
  python -m installer --destdir="$pkgdir" *.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 argos-translate.png -t "$pkgdir/usr/share/pixmaps/"
  install -Dm644 argos-translate.desktop -t "$pkgdir/usr/share/applications/"
}
