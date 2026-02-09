pkgname=cloudtolocalllm-appimage
pkgver=10.1.201
pkgrel=1
pkgdesc="Privacy-first local AI workspace (AppImage version)"
arch=('x86_64')
url="https://github.com/CloudToLocalLLM-online/CloudToLocalLLM"
license=('MIT')
depends=('fuse2' 'libayatana-appindicator' 'gtk3' 'libsecret')
provides=('cloudtolocalllm')
conflicts=('cloudtolocalllm-git' 'cloudtolocalllm-bin')
options=(!strip)
_appimage="cloudtolocalllm-${pkgver}-x86_64.AppImage"
source=("${_appimage}::${url}/releases/download/v${pkgver}/${_appimage}")
sha256sums=('e3e27559da7006fbeae6f9034a57ec5493f77707607d458eb3b597db46a378b2')

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/usr/bin/cloudtolocalllm"
    
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/cloudtolocalllm.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=CloudToLocalLLM
GenericName=AI Model Bridge
Comment=Privacy-first local AI workspace
Icon=cloudtolocalllm
Exec=cloudtolocalllm %u
Terminal=false
Categories=Development;Utility;
Keywords=AI;LLM;OpenClaw;Machine Learning;
MimeType=x-scheme-handler/cloudtolocalllm;
EOF
}
