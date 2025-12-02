# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-switch-bin
pkgver=3.8.2
pkgrel=1
pkgdesc="Claude Code & Codex 供应商配置管理工具"
arch=('x86_64')
url="https://github.com/farion1231/cc-switch"
license=('mit')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3')
source=("CC-Switch-v${pkgver}-Linux.deb::https://github.com/farion1231/cc-switch/releases/download/v${pkgver}/CC-Switch-v${pkgver}-Linux.deb")
md5sums=('e4217cd0ff21c67a32793339978503dc')

package() {
    # Extract the deb package
    ar p "${srcdir}/CC-Switch-v${pkgver}-Linux.deb" data.tar.gz | tar xz -C "${pkgdir}"

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}"
}
