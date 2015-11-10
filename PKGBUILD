# Maintainer: Vanitas <ssbianjp [AT] gmail.com>

pkgname=lyy-downloader
pkgver=4.0
pkgrel=1
pkgdesc="A gui program to download videos from China video websites"
arch=('x86_64' 'i686')
url="http://mathjoy.lofter.com/post/42208d_7cabd00"
license=('custom')
depends=()
install=${pkgname}.install

source=('lyy-downloader.desktop')
md5sums=('d276eaf627317aa7b7495e2af0cb341e')

source_i686=("http://public.vanitas.me/lyy-downloader/lyy-downloader-${pkgver}-i686.tar.gz")
md5sums_i686=('175d67aec92ae6a90e14af6a284f9328')

source_x86_64=("http://public.vanitas.me/lyy-downloader/lyy-downloader-${pkgver}-x86_64.tar.gz")
md5sums_x86_64=('c084b636d24010eea2f78293608d316f')

package(){
  cd ${srcdir}

  install -dm755 "${pkgdir}/opt"
  cp --preserve=mode -r "lyy-downloader" "${pkgdir}/opt/lyy-downloader"

  for res in 256x256 128x128 48x48 32x32 16x16; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
    ln -s "/opt/lyy-downloader/icons/${res}.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/lyy-downloader.png"
  done

  install -dm755 "${pkgdir}/usr/share/applications"
  install -Dm644 "lyy-downloader.desktop" "${pkgdir}/usr/share/applications/lyy-downloader.desktop"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/lyy-downloader/LYYDownloader" "${pkgdir}/usr/bin/lyy-downloader"
}
