# Maintainer: gonwe <gonwex@gmail.com>
pkgname=gnome-shell-extension-ai-usage
_extuuid=ai-usage@gonwex-gmail.com
_commit=ab8b849
pkgver=1
pkgrel=1
pkgdesc="AI Usage Indicator: Show Codex usage quota and DeepSeek API balance in GNOME top bar"
arch=('any')
url="https://github.com/gonwe/gonwe-ai-usage"
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gonwe/gonwe-ai-usage/archive/${_commit}.tar.gz")
install="${pkgname}.install"
sha256sums=('SKIP')

package() {
    cd "$srcdir"
    cd gonwe-ai-usage-*

    # Install extension files
    install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_extuuid}"
    cp -r extension/* "${pkgdir}/usr/share/gnome-shell/extensions/${_extuuid}/"

    # Remove pre-compiled schema (will be recompiled on install)
    rm -f "${pkgdir}/usr/share/gnome-shell/extensions/${_extuuid}/schemas/gschemas.compiled"
}
