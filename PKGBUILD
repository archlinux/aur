# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=aliza
pkgver=2.2.0
pkgrel=1
pkgdesc="Medical Imaging. Open 2D, 3D and 4D images in DICOM, MetaIO, Nifti, Nrrd and other formats, incl. THIS PACKAGE REQUIRES PAID LICENSE!"
arch=('x86_64')
url="http://www.aliza-dicom-viewer.com"
license=('custom')
depends=('hicolor-icon-theme'
         'libxt'
         'libglvnd')
options=('!emptydirs')
source=("https://www.aliza-medical-imaging.de/aliza-${pkgver}.tar.gz")
sha512sums=('99e3455764d93557b019440424ebf9476f22d5ffb00cb3ff50aaba466c46300fc520192ea3272fb0a374552e4b083a2f384b7bf761a61982f348a158f8240ddd')
#noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
    ALIZA_DIR="/opt/aliza"
    ALIZA_C_DIR="${pkgdir}${ALIZA_DIR}/install_menu"
    ALIZA_I_DIR="${pkgdir}/usr/share/icons/hicolor"

    find "${pkgdir}" -type d -exec chmod 777 {} \;
    
    mkdir -p "${pkgdir}${ALIZA_DIR}"
    cp -r "${pkgname}-${pkgver}"/* "${pkgdir}${ALIZA_DIR}"

    #tar xzf "${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}${ALIZA_DIR}" --strip 1 --owner root --group root
    #install -d 

    mkdir -p "${pkgdir}/usr/share/applications";
    mkdir -p "${ALIZA_I_DIR}/16x16/apps";
    mkdir -p "${ALIZA_I_DIR}/22x22/apps";
    mkdir -p "${ALIZA_I_DIR}/24x24/apps";
    mkdir -p "${ALIZA_I_DIR}/32x32/apps";
    mkdir -p "${ALIZA_I_DIR}/36x36/apps";
    mkdir -p "${ALIZA_I_DIR}/42x42/apps";
    mkdir -p "${ALIZA_I_DIR}/48x48/apps";
    mkdir -p "${ALIZA_I_DIR}/64x64/apps";
    mkdir -p "${ALIZA_I_DIR}/72x72/apps";
    mkdir -p "${ALIZA_I_DIR}/96x96/apps";
    mkdir -p "${ALIZA_I_DIR}/128x128/apps";
    mkdir -p "${ALIZA_I_DIR}/192x192/apps";
    mkdir -p "${ALIZA_I_DIR}/256x256/apps";
    mkdir -p "${ALIZA_I_DIR}/scalable/apps";
    cp "${ALIZA_C_DIR}/icons/hicolor/16x16/apps/aliza.png"    "${ALIZA_I_DIR}/16x16/apps"
    cp "${ALIZA_C_DIR}/icons/hicolor/22x22/apps/aliza.png"    "${ALIZA_I_DIR}/22x22/apps"
    cp "${ALIZA_C_DIR}/icons/hicolor/24x24/apps/aliza.png"    "${ALIZA_I_DIR}/24x24/apps"
    cp "${ALIZA_C_DIR}/icons/hicolor/32x32/apps/aliza.png"    "${ALIZA_I_DIR}/32x32/apps"
    cp "${ALIZA_C_DIR}/icons/hicolor/36x36/apps/aliza.png"    "${ALIZA_I_DIR}/36x36/apps"
    cp "${ALIZA_C_DIR}/icons/hicolor/42x42/apps/aliza.png"    "${ALIZA_I_DIR}/42x42/apps"
    cp "${ALIZA_C_DIR}/icons/hicolor/48x48/apps/aliza.png"    "${ALIZA_I_DIR}/48x48/apps"
    cp "${ALIZA_C_DIR}/icons/hicolor/64x64/apps/aliza.png"    "${ALIZA_I_DIR}/64x64/apps"
    cp "${ALIZA_C_DIR}/icons/hicolor/72x72/apps/aliza.png"    "${ALIZA_I_DIR}/72x72/apps"
    cp "${ALIZA_C_DIR}/icons/hicolor/96x96/apps/aliza.png"    "${ALIZA_I_DIR}/96x96/apps"
    cp "${ALIZA_C_DIR}/icons/hicolor/128x128/apps/aliza.png"  "${ALIZA_I_DIR}/128x128/apps"
    cp "${ALIZA_C_DIR}/icons/hicolor/192x192/apps/aliza.png"  "${ALIZA_I_DIR}/192x192/apps"
    cp "${ALIZA_C_DIR}/icons/hicolor/256x256/apps/aliza.png"  "${ALIZA_I_DIR}/256x256/apps"
    cp "${ALIZA_C_DIR}/icons/hicolor/scalable/apps/aliza.svg" "${ALIZA_I_DIR}/scalable/apps"
    ALIZA_DS_FILE="${pkgdir}/usr/share/applications/aliza.desktop"
    ALIZA_EXE="${ALIZA_DIR}/aliza.sh"
    echo "[Desktop Entry]"              > "${ALIZA_DS_FILE}"
    echo "Type=Application"            >> "${ALIZA_DS_FILE}"
    echo "Encoding=UTF-8"              >> "${ALIZA_DS_FILE}"
    echo "Name=Aliza"                  >> "${ALIZA_DS_FILE}"
    echo "GenericName=Aliza"           >> "${ALIZA_DS_FILE}"
    echo "Comment=Medical Imaging"     >> "${ALIZA_DS_FILE}"
    echo "Exec=\"${ALIZA_EXE}\" %F"    >> "${ALIZA_DS_FILE}"
    echo "Icon=aliza"                  >> "${ALIZA_DS_FILE}"
    echo "Terminal=false"              >> "${ALIZA_DS_FILE}"
    echo "Categories=Graphics;"        >> "${ALIZA_DS_FILE}"
    echo "StartupNotify=false"         >> "${ALIZA_DS_FILE}"
    echo "MimeType=application/dicom;" >> "${ALIZA_DS_FILE}"
    chmod +x "${ALIZA_DS_FILE}"
}
