## Author: Mohammad Odeh <astronomycenter.net>
# Maintainer: dj.zak <dz.wbdev@gmail.com>
pkgname=accutimes
pkgver=5.7
pkgrel=6
pkgdesc="المواقيت الدقيقة،Accurate Times is the official software adopted by the Jordanian Ministry of Islamic Affairs to calculate the prayer times in Jordan."
arch=('x86_64')
url="https://astronomycenter.net/accut.html"
license=('custom')
depends=('wine' 'bash')
source=('accutimes.tar.xz::https://github.com/dzwdev/Accurate_Times/raw/3471365352b5f7c7040723627fab31958b9c4863/accutimes.tar.xz')
sha256sums=('24062493f22cfe8e7a9bf54b0f4ad0ec97ef23adeac734781e9cd1bd6e7325c9')

package() {
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    mv "${srcdir}/accurate_times/"* "${pkgdir}/usr/share/${pkgname}/"
    find "$pkgdir"/usr/share -type f -exec chmod 644 "{}" \;
    find "$pkgdir"/usr/share -type d -exec chmod 755 "{}" \;
    install -Dm755 "${srcdir}/accutimes.sh" "${pkgdir}/usr/bin/accutimes.sh"
    install -Dm644 "${srcdir}/accutimes.desktop" "${pkgdir}/usr/share/applications/accutimes.desktop"
    }
