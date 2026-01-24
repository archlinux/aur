# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-switch-bin
pkgver=3.10.2
pkgrel=1
pkgdesc="A cross-platform desktop All-in-One assistant tool for Claude Code, Codex & Gemini CLI."
arch=('x86_64')
url="https://github.com/farion1231/cc-switch"
license=('mit')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3')
source=("CC-Switch-v${pkgver}-Linux.deb::https://github.com/farion1231/cc-switch/releases/download/v${pkgver}/CC-Switch-v${pkgver}-Linux.deb")
md5sums=('f1c1747c5812b7e6ff2fb8358dd736af')

package() {
    # Extract the deb package
    ar p "${srcdir}/CC-Switch-v${pkgver}-Linux.deb" data.tar.gz | tar xz -C "${pkgdir}"

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}"
}
