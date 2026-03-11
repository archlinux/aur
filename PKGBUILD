pkgname=s3man-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Cross-platform S3 desktop manager"
arch=('x86_64' 'aarch64')
url="https://github.com/sarrietav-dev/s3man"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=s3man.install
source_x86_64=("${url}/releases/download/v${pkgver}/s3man_${pkgver}_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/s3man_${pkgver}_arm64.deb")
sha256sums_x86_64=('69a9f603468c0aaee09c70b2494bc475a87612d188f82870dee1c1cd6da02707')
sha256sums_aarch64=('REPLACE_WITH_ARM64_SHA256')

package() {
  local deb_file
  if [[ "${CARCH}" == "x86_64" ]]; then
    deb_file="s3man_${pkgver}_amd64.deb"
  else
    deb_file="s3man_${pkgver}_arm64.deb"
  fi

  bsdtar -xf "${srcdir}/${deb_file}" -C "${srcdir}"
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
