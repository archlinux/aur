# Maintainer: Voylin
pkgname=pomodachi-bin
pkgver=0.1_alpha
pkgrel=1
pkgdesc="A pomodoro timer and activity tracker made with Godot"
arch=('x86_64')
url="https://github.com/Voylin/pomodachi"
license=('MIT')
provides=('pomodachi')
depends=('fontconfig' 'libglvnd' 'libx11' 'libxcursor' 'libxrandr' 'libxi' 'alsa-lib')

source_x86_64=("https://github.com/Voylin/pomodachi/releases/download/v${pkgver//_/-}/Pomodachi_linux_release_v${pkgver//_/-}.tar"
               "https://raw.githubusercontent.com/Voylin/pomodachi/master/pomodachi.desktop"
               "https://raw.githubusercontent.com/Voylin/pomodachi/master/src/icon.svg"
			   "https://raw.githubusercontent.com/Voylin/pomodachi/master/LICENSE")

sha256sums_x86_64=('5d1d7c8b9259cf1c775f23a079d81a98d0359355a74101eb11897c9bf9348fa6'
                   '7f6d4dd75bc2d98cdd73472e63d725d5610e41e2ac792177b6ba2e3a3353e1a5'
                   '9285d592fb1b54de9c57814da0b0a4bfbdac8a17ca2e0f2ee539022d43d46633'
                   'a2ffce240f466f958ca202ce9eb401b3da8cdfe39e34a952e8a9eb1598b9f46f')

package() {
    install -Dm755 "${srcdir}/bin/Linux/Pomodachi.x86_64" "${pkgdir}/opt/pomodachi/pomodachi"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/pomodachi/pomodachi" "${pkgdir}/usr/bin/pomodachi"

    install -Dm644 "${srcdir}/pomodachi.desktop" "${pkgdir}/usr/share/applications/pomodachi.desktop"
    install -Dm644 "${srcdir}/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/pomodachi.svg"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

