# Maintainer: Christopher Maltais <christopher.maltais@gmail.com>
pkgname=cloudtolocalllm
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
sha256sums=('7a81e80888a5975d02b1527f596071bf8e4972870970eceadd1a31e213f2892f')

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
