## Author: Mohammad Odeh <astronomycenter.net>
# Maintainer: dj.zak <dz.wbdev@gmail.com>
pkgname=accutimes
pkgver=5.7
pkgrel=7
pkgdesc="المواقيت الدقيقة،Accurate Times is the official software adopted by the Jordanian Ministry of Islamic Affairs to calculate the prayer times in Jordan."
arch=('x86_64')
url="https://astronomycenter.net/accut.html"
license=('custom')
depends=('wine' 'bash')
source=('https://github.com/dzwdev/Accurate_Times/raw/3af98937854bfbcb38c85dc323f858b4b59055a3/accutimes.tar.xz')
sha256sums=('470c0b0e6d5ea293c2fc539f42df3c1bc4a7a363cb290399f82f462e00b72610')

package() {
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    mv "${srcdir}/accurate_times/"* "${pkgdir}/usr/share/${pkgname}/"
    find "$pkgdir"/usr/share -type f -exec chmod 644 "{}" \;
    find "$pkgdir"/usr/share -type d -exec chmod 755 "{}" \;
    install -Dm755 "${srcdir}/accutimes.sh" "${pkgdir}/usr/bin/accutimes.sh"
    install -Dm644 "${srcdir}/accutimes.desktop" "${pkgdir}/usr/share/applications/accutimes.desktop"
    }
