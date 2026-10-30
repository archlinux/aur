# Maintainer: rdbt <87152661+rdbtCVS@users.noreply.github.com>
pkgname=horizon-launcher-bin
# Upstream reset 0.17.0 to 0.2.x with the launcher@ tag scheme.
epoch=1
pkgver=0.2.28
pkgrel=1
_tag=launcher@0.2.28
pkgdesc='Horizon is Minecraft Java Edition rewritten in Rust'
arch=('x86_64')
url='https://github.com/horizon-rust/horizon'
license=('MIT' 'OFL-1.1')
depends=('bash' 'glibc' 'libgcc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11'
         'wayland' 'vulkan-icd-loader' 'hicolor-icon-theme' 'xdg-utils')
# Wayland and Vulkan are loaded dynamically; xdg-utils opens browser links.
optdepends=('jdk25-openjdk: Java 25 JDK for preparing game resources'
            'python: preparation of older Horizon releases'
            'vulkan-driver: Vulkan graphics driver for the launcher and game'
            'gnome-keyring: persist Microsoft sign-in through Secret Service'
            'kwallet: alternative Secret Service provider for Microsoft sign-in')
provides=("horizon-launcher=$pkgver")
conflicts=('horizon-launcher')
options=('!strip' '!debug')
source=("horizon-launcher-${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/${_tag}/horizon-launcher-linux-x86_64.tar.gz"
        'horizon-launcher.sh'
        'horizon-launcher.desktop'
        'horizon.desktop'
        'horizon.svg'
        'LICENSE.upstream'
        'OFL-Geist.txt'
        'LICENSE')
sha256sums=(
    '3a42a8caeb4be4e6525d2dad367043a396d918e1da0bb249948aeec15e847f85'
    '7f92a543eba884aa862eca36639790437f2d1bc41ae2d24b0556dd6aa2cc3287'
    'fb11867fdefb560a12d0edd06555ded73c520e7e72cf6f3959a074a4a13d3c90'
    '2eb5834d6d0b1189bef3f3f73139ca2fee7f5c837a4aaeb0df744005303b6a54'
    '2a8c0871ae8a1fc4d3be47c8ce187ee5411d9553da241411ddd7e75c61373eb3'
    'b4b374ae9d0f2d8f7be35c6783e41327431da3b5662605da9ba31493630621df'
    'c683bfbcc7e087f5d37a54ef628f10387c451a83ddc459b151403a164ac46c90'
    'b773f1017df675b4ef0958601bcb4b800805bfb3ef4d6ba8366ae95bd57fdf57'
)

package() {
    install -Dm755 horizon-launcher "$pkgdir/usr/lib/horizon-launcher/horizon-launcher"
    install -Dm755 horizon-launcher.sh "$pkgdir/usr/bin/horizon-launcher"
    install -Dm644 horizon-launcher.desktop "$pkgdir/usr/share/applications/horizon-launcher.desktop"
    install -Dm644 horizon.desktop "$pkgdir/usr/share/applications/horizon.desktop"
    install -Dm644 horizon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/horizon.svg"
    install -Dm644 LICENSE.upstream "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.packaging"
    install -Dm644 OFL-Geist.txt "$pkgdir/usr/share/licenses/$pkgname/OFL-Geist.txt"
}
