## Author: shamela team <shamela.ws>
# Maintainer: dj.zak <dz.wbdev@gmail.com>
pkgname=shamela
pkgver=4
pkgrel=6
pkgdesc="المكتبة الشاملة، A digital library which enables you to download, read and search arabic books."
arch=('x86_64')
url="https://shamela.ws/page/download"
license=('custom')
depends=('wine' 'winetricks' 'bash')
source=('database.tar.xz::https://github.com/dzwdev/shamela/raw/4dd2022cb5eb634235f32606276bea28a4021c6c/database.tar.xz'
'shamela4_x64.tar.xz::https://github.com/dzwdev/shamela/raw/4dd2022cb5eb634235f32606276bea28a4021c6c/shamela4_x64.tar.xz'
'shamela4_x32.tar.xz::https://github.com/dzwdev/shamela/raw/26f44ac07aa2161add313868ca7959ae92386a12/shamela4_x32.tar.xz')
sha256sums=('9fd7f3675fe04fc8f1b771eb70843a632b3eed9f8640e7e8d77770dd2d612b16'
'f4e08e85ef0409fa12c397533108290fce578298ecee4e7709c548b6850841ff'
'c616fd71d1fdb15db9943cd6b0f774d1c10fae27e4fa35049e923b81f8b42106')

package() {
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    mv "${srcdir}/shamela4/"* "${pkgdir}/usr/share/${pkgname}/"
    find "$pkgdir"/usr/share -type f -exec chmod 644 "{}" \;
    find "$pkgdir"/usr/share -type d -exec chmod 755 "{}" \;
    install -Dm755 "${srcdir}/shamela.sh" "${pkgdir}/usr/bin/shamela.sh"
    install -Dm644 "${srcdir}/shamela.desktop" "${pkgdir}/usr/share/applications/shamela.desktop"
    }
