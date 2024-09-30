## Author: Mohammad Odeh <astronomycenter.net>
# Maintainer: dj.zak <dz.wbdev@gmail.com>
pkgname=accutimes
pkgver=5.7
pkgrel=5
pkgdesc="المواقيت الدقيقة،Accurate Times is the official software adopted by the Jordanian Ministry of Islamic Affairs to calculate the prayer times in Jordan."
arch=('x86_64')
url="https://astronomycenter.net/accut.html"
license=('custom')
depends=('wine' 'bash')
source=('accutimes.tar.xz::https://github.com/dzwdev/Accurate_Times/raw/292b4e85092c3b087ba3b77997c3ce25594fe48f/accutimes.tar.xz')
sha256sums=('db01e7f9afd8ff082e3f53b6848c5c6b2f2b6a9092352d618ec16535c3e71bce')

package() {
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    mv "${srcdir}/accurate_times/"* "${pkgdir}/usr/share/${pkgname}/"
    find "$pkgdir"/usr/share -type f -exec chmod 644 "{}" \;
    find "$pkgdir"/usr/share -type d -exec chmod 755 "{}" \;
    install -Dm755 "${srcdir}/accutimes.sh" "${pkgdir}/usr/bin/accutimes.sh"
    install -Dm644 "${srcdir}/accutimes.desktop" "${pkgdir}/usr/share/applications/accutimes.desktop"
    }
