# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-switch-bin
pkgver=3.7.1
pkgrel=1
pkgdesc="Claude Code & Codex 供应商配置管理工具"
arch=('x86_64')
url="https://github.com/farion1231/cc-switch"
license=('mit')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3')
source=("CC-Switch-v${pkgver}-Linux.deb::https://github.com/farion1231/cc-switch/releases/download/v${pkgver}/CC-Switch-v${pkgver}-Linux.deb")
md5sums=('42166658b01f1379ad23b9e96ff852c7')

package() {
    # Extract the deb package
    ar p "${srcdir}/CC-Switch-v${pkgver}-Linux.deb" data.tar.gz | tar xz -C "${pkgdir}"

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}"
}
