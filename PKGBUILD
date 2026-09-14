# Maintainer: Ragu Manjegowda <raghavendrahm0410@gmail.com>

pkgname=qt-solarized
pkgver=1.0.0
pkgrel=1
pkgdesc='Solarized light and dark palettes for launching Qt applications'
arch=('any')
url='https://aur.archlinux.org/packages/qt-solarized'
license=('MIT')
depends=('glib2')
optdepends=('darkman: automatic light and dark theme detection')
source=('qt-solarized' 'solarized-light.qss' 'solarized-dark.qss' 'test.sh' 'LICENSE')
sha256sums=('a4da269c548e6902d0c1db0ebd34f44b799401fae1f3f5f66f87fab151a55796'
            '764e34a64ee28e682f2c211b4fb5d90afa1d7be6efed7a5d4c066e9d31281bd2'
            'cafe17b7a9bb63eb31ea4dd57226b65c87e58e2ad7be4f8ee7230de54107f979'
            '49cd665f4a726105f12473b4ce64948222dd1901f12130abb8e6eaeafae37a0b'
            '037d4a7764d8a6221f0caf8e705c0af171dee81db6c5101dd47732b5b1e56248')

check() {
    bash test.sh
}

package() {
    install -Dm755 qt-solarized "$pkgdir/usr/bin/qt-solarized"
    install -Dm644 solarized-light.qss \
        "$pkgdir/usr/share/qt-solarized/solarized-light.qss"
    install -Dm644 solarized-dark.qss \
        "$pkgdir/usr/share/qt-solarized/solarized-dark.qss"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
