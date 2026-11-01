# Maintainer: AmetistYT <ametist0yt@gmail.com>
pkgname=soundpaaad-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Soundpad alternative with PipeWire virtual mic & global hotkeys (Rust + egui)"
arch=('x86_64')
url="https://github.com/ametistik1337/soundpaad"
license=('MIT')
depends=('pipewire-pulse' 'libpulse' 'openssl')
optdepends=('pulseaudio: PulseAudio server (alternative to PipeWire)')
provides=('soundpaad' 'soundpad')
conflicts=('soundpaad' 'soundpad')
source=("soundpaad-${pkgver}::https://github.com/ametistik1337/soundpaad/releases/download/v${pkgver}/soundpaad"
        "com.soundpaad.app.desktop"
        "com.soundpaad.app.svg")
sha256sums=('668df2c35e4abf155d544fd89df6c0734f3e7aaf1a79ebb99c0dc443e6575271'
            '71ed0753bd4a074ef9ea75587925b46573d15688a538255553ecf414d91b6ad5'
            'd356082e45c55f2e48f59821f280cf9799cbcb8238de0afe54ff296e2cb3e238')

package() {
    install -Dm755 "soundpaad-${pkgver}" "${pkgdir}/usr/bin/soundpaad"
    install -Dm644 "com.soundpaad.app.desktop" "${pkgdir}/usr/share/applications/com.soundpaad.app.desktop"
    install -Dm644 "com.soundpaad.app.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.soundpaad.app.svg"
}
