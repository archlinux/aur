# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-switch-bin
pkgver=3.4.0
pkgrel=3
pkgdesc="Claude Code & Codex 供应商配置管理工具"
arch=('x86_64')
url="https://github.com/farion1231/cc-switch"
license=('mit')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3')
source=("CC.Switch_${pkgver}_amd64.deb::https://github.com/farion1231/cc-switch/releases/download/v${pkgver}/CC.Switch_${pkgver}_amd64.deb")
md5sums=('bc80438ab8baecac40c41043b5e668d0')

package() {
    # Extract the deb package
    ar p "${srcdir}/CC.Switch_${pkgver}_amd64.deb" data.tar.gz | tar xz -C "${pkgdir}"

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}"
}
