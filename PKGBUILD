# Maintainer: ahmed-x86 الشاب الوسيم جدا

pkgname=altayibat-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="نظام الطيبات (altayibat) - سلة المهملات لـ ضياء العوضي | trash meme"
arch=('any')
url="https://github.com/ahmed-x86/altayibat-bin"
license=('Unlicense')
depends=('xdg-utils' 'libnotify' 'bash')
source=('setup-trash.sh')
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/setup-trash.sh" "${pkgdir}/usr/bin/setup-trash"
    mkdir -p "${pkgdir}/usr/share/applications"
    cat <<EOF > "${pkgdir}/usr/share/applications/altayibat.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=نظام الطيبات
Comment=المكان الطبيعي لنظام الطيبات
Exec=sh -c 'setup-trash; xdg-open trash:/// & notify-send "إشعار" "سلة الزبالة مكان نظام الطيبات"'
Icon=user-trash
Terminal=true
Categories=Utility;
Keywords=نظام;الطيبات;زبالة;trash;altayibat;
EOF

    chmod 644 "${pkgdir}/usr/share/applications/altayibat.desktop"
}