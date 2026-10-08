# Maintainer: pika02

pkgname=lingxi-ai-bin
_pkgname=lingxi-ai
pkgver=1.4.7
pkgrel=3
pkgdesc="WPS Office AI Agent 插件（灵犀AI），支持多种大模型、MCP与本地化部署"
arch=('x86_64')
url="https://wps-ai.llteac.cn"
license=('unknown')
depends=('bash' 'rsync')
optdepends=('wps-office: 国际版基础依赖'
            'wps-office-cn: 国内版体验更好，支持更多API')
options=('!strip') 
source=("https://llteac-file.oss-cn-hangzhou.aliyuncs.com/wps-ai/releases/${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.gz")
sha256sums=('415e73b0b19ae02dfae646ac426e5164410b0dc072180aa4a1435ded679e07dd')
install=${pkgname}.install

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    cd "${srcdir}/${_pkgname}-${pkgver}" || exit
    cp -a * "${pkgdir}/opt/${_pkgname}/"
    chmod +x "${pkgdir}/opt/${_pkgname}/install.sh"
    chmod +x "${pkgdir}/opt/${_pkgname}/uninstall.sh"
    chmod +x "${pkgdir}/opt/${_pkgname}/plugin/runtime/node-linux-x64/bin/node"
    find "${pkgdir}/opt/${_pkgname}/plugin/tools/" -name "*.sh" -exec chmod +x {} \;
}
