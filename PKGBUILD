pkgname=prevu
pkgver=0.1.6
pkgrel=1
pkgdesc="Local-first preview social link cards instantly before deployment"
arch=('x86_64')
url="https://github.com/dhanushk-offl/prevu"
license=('MIT')

depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup')

options=('!strip')

source_x86_64=("${url}/releases/download/v${pkgver}/PREVU_${pkgver}_amd64.deb")

sha256sums_x86_64=('53dcdc5e934006ad830640bd4cd750b017e05891f2aebefb77546d245289b2fd')

package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

  # create a nicer command name
  ln -s /usr/bin/prevu-desktop "${pkgdir}/usr/bin/prevu"
}
