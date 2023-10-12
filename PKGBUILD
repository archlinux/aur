# Maintainer: Mihók Martin <mihok.martin@protonmail.com>
# Contributor: FabioLolix <fabio.loli@disroot.org>
# Contributor: Niklas Wojtkowiak <aur.7xcqe@passmail.com>
_pkgname='spacedrive'
pkgname="${_pkgname}-bin"
pkgver='0.1.0'
pkgrel='1'
epoch='1'
pkgdesc="A file manager from the future."
arch=('x86_64')
url="https://spacedrive.com"
_url_source='https://github.com/spacedriveapp/spacedrive'
license=('AGPL3')
source=("${_url_source}/releases/download/${pkgver}/Spacedrive-linux-x86_64.deb")
sha256sums=('9c38bea4466551a67a28f1b43e0e0262b6893179b2566f7e72b5ec3aa2f47db7')
depends=(gtk3 ffmpeg4.4 webkit2gtk openssl-1.1 glibc gcc-libs glib2 pango libsoup cairo gdk-pixbuf2 libheif)
provides=(spacedrive)
conflicts=(spacedrive)

package() {
  tar -xf "${srcdir}/data.tar.gz" --directory "${srcdir}"
  chmod -R 755 "${srcdir}/usr/share/"
  install -Dm755 "${srcdir}/usr/bin/spacedrive" "${pkgdir}/usr/bin/spacedrive"
  install -dm755 "${pkgdir}/usr/share/"
  cp -r "${srcdir}/usr/share/" "${pkgdir}/usr/"
}

