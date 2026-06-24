# Maintainer: psychosomat <hello@ddark.dev>
pkgname=crisper-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Local video transcription with speaker diarization'
arch=('x86_64')
url='https://github.com/psychosomat/Crisper'
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
provides=('crisper')
conflicts=('crisper')
source=("https://github.com/psychosomat/Crisper/releases/download/v0.1.0/Crisper-0.1.0-linux-amd64.tar.gz")
sha256sums=('824ce72079db94bf89b87e8923c4f4dc33423021f9e324db49ed799e454067d6')

package() {
    install -Dm755 Crisper "${pkgdir}/usr/bin/Crisper"
    install -Dm644 appicon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/crisper.png"

    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/crisper.desktop" << EOF2
[Desktop Entry]
Type=Application
Name=Crisper
Exec=/usr/bin/Crisper
Icon=crisper
Categories=AudioVideo;Audio;
Terminal=false
EOF2
}
