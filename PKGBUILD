# Maintainer: modula t. <defaultxr at pm dot me>
# Contributor: Juan Perez <gatitofeliz at protonmail at com>

pkgname=audacity-plugins
pkgver=20171216
pkgrel=1
pkgdesc="Additional Nyquist plugins for Audacity"
arch=('any')
depends=('audacity')
url="https://github.com/nyancat18/audacity-plugin"
license=('None')
source=("git+https://github.com/nyancat18/audacity-plugin.git")
sha384sums=('SKIP')

package() {
    cd "${srcdir}/audacity-plugin"
    rm notch.ny # Already included in Audacity.
    mkdir -p "${pkgdir}/usr/share/audacity/plug-ins"
    for file in ${srcdir}/audacity-plugin/*.ny; do
        install -D -m644 "${file}" "${pkgdir}/usr/share/audacity/plug-ins/"
    done
}
