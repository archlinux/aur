# Maintainer: Laoyou2333 <laoyou2333@confidesk.com>
pkgname=clamui
pkgver=0.3.0
pkgrel=3
pkgdesc="ClamUI is a modern Linux desktop application that provides a graphical user interface for the ClamAV antivirus command-line tool."
arch=('any')
url="https://clamui.com"
license=('MIT')
provide=('clamui' 'python-clamui')
depends=('python' 'python-build' 'python-installer' 'python-gobject' 'python-cairo' 'gtk4' 'clamav' 'polkit' 'python-requests' 'python-urllib3' 'python-keyring' 'python-matplotlib' 'python-hatchling' 'python-psutil' 'python-pillow' 'libadwaita')
source=("git+https://github.com/linx-systems/clamui#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd ${pkgname}
    python -m build --wheel --no-isolation
}
package() {
    cd ${pkgname}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "${srcdir}/${pkgname}/data/io.github.linx_systems.ClamUI.desktop" "${pkgdir}/usr/share/applications/io.github.linx_systems.ClamUI.desktop"
    install -Dm644 "${srcdir}/${pkgname}/scripts/clamui-scan-nautilus.sh" "${pkgdir}/usr/share/clamui/integrations/clamui-scan-nautilus.sh"
    install -Dm644 "${srcdir}/${pkgname}/scripts/clamui-virustotal-nautilus.sh" "${pkgdir}/usr/share/clamui/integrations/clamui-virustotal-nautilus.sh"
    install -Dm644 "${srcdir}/${pkgname}/icons/io.github.linx_systems.ClamUI.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/io.github.linx_systems.ClamUI.png"
    install -Dm644 "${srcdir}/${pkgname}/icons/io.github.linx_systems.ClamUI.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.linx_systems.ClamUI.svg"
    install -Dm644 "${srcdir}/${pkgname}/data/io.github.linx_systems.ClamUI-virustotal.desktop" "${pkgdir}/usr/share/kio/servicemenus/io.github.linx_systems.ClamUI-virustotal.desktop"
    install -Dm644 "${srcdir}/${pkgname}/data/io.github.linx_systems.ClamUI.service.desktop" "${pkgdir}/usr/share/kio/servicemenus/io.github.linx_systems.ClamUI.service.desktop"
    install -Dm644 "${srcdir}/${pkgname}/data/io.github.linx_systems.ClamUI-virustotal.desktop" "${pkgdir}/usr/share/kservices5/ServiceMenus/io.github.linx_systems.ClamUI-virustotal.desktop"
    install -Dm644 "${srcdir}/${pkgname}/data/io.github.linx_systems.ClamUI.service.desktop" "${pkgdir}/usr/share/kservices5/ServiceMenus/io.github.linx_systems.ClamUI.service.desktop"
    install -Dm644 "${srcdir}/${pkgname}/data/io.github.linx_systems.ClamUI.metainfo.xml" "${pkgdir}/usr/share/metainfo/io.github.linx_systems.ClamUI.metainfo.xml"
    install -Dm644 "${srcdir}/${pkgname}/data/io.github.linx_systems.ClamUI-virustotal.nemo_action" "${pkgdir}/usr/share/nemo/actions/io.github.linx_systems.ClamUI-virustotal.nemo_action"
    install -Dm644 "${srcdir}/${pkgname}/data/io.github.linx_systems.ClamUI.nemo_action" "${pkgdir}/usr/share/nemo/actions/io.github.linx_systems.ClamUI.nemo_action"
    install -Dm644 "${srcdir}/${pkgname}/data/io.github.linx_systems.ClamUI.policy" "${pkgdir}/usr/share/polkit-1/actions/io.github.linx_systems.ClamUI.policy"
}
