# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-switch-bin
pkgver=3.10.0
pkgrel=1
pkgdesc="A cross-platform desktop All-in-One assistant tool for Claude Code, Codex & Gemini CLI."
arch=('x86_64')
url="https://github.com/farion1231/cc-switch"
license=('mit')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3')
source=("CC-Switch-v${pkgver}-Linux.deb::https://github.com/farion1231/cc-switch/releases/download/v${pkgver}/CC-Switch-v${pkgver}-Linux.deb")
md5sums=('e715f46622bfb544a91838ff521ae15a')

package() {
    # Extract the deb package
    ar p "${srcdir}/CC-Switch-v${pkgver}-Linux.deb" data.tar.gz | tar xz -C "${pkgdir}"

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}"
}
