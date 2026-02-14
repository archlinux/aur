# Maintainer: YatoVoid <your.email@example.com>
pkgname=human-detection-camera
pkgver=1.0.0
pkgrel=1
pkgdesc="Cross-platform human detection camera app that triggers custom keybinds when humans are detected"
arch=('any')
url="https://github.com/YatoVoid/human-detection-keybind-system"
license=('MIT')
depends=(
    'python'
    'python-opencv'
    'python-numpy'
    'python-pyqt5'
    'python-pynput'
    'xdotool'
)
makedepends=('git')
optdepends=(
    'v4l-utils: for camera detection and management'
)
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "$srcdir/human-detection-keybind-system"
    
    install -Dm755 human_detection_app.py "$pkgdir/usr/bin/$pkgname"
    install -Dm644 human-detection-camera.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    
    if [ -f "icon.png" ]; then
        install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
    fi
    
    install -Dm644 Readme.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
