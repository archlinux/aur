# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=pica-comic-bin
pkgdesc="A comic app built with Flutter, supporting multiple comic sources"
pkgver=4.2.4
pkgrel=2
arch=('x86_64')
url="https://github.com/Pacalini/PicaComic"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
conflicts=('pica-comic')
source=("https://github.com/Pacalini/PicaComic/releases/download/v${pkgver}/PicaComic-${pkgver}-amd64.deb")
sha256sums=('a6fe36fd452fc4d6926028c5f93ccfa62fe396185ff2dd0a1cf123738c3477e1')

package() {
    tar -I zstd -xf data.tar.zst -C "${pkgdir}/"
    install -d "${pkgdir}/usr/local/bin"
    ln -sf /usr/local/lib/pica-comic/pica_comic "${pkgdir}/usr/local/bin/pica-comic"
}
