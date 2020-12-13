# Maintainer: Christian Schendel <doppelhelix at gmail dot com>
pkgname=gnome-shell-extension-applications-overview-tooltip-git
pkgver=10
pkgrel=1
pkgdesc="Shows a tooltip over applications icons on applications overview"
arch=(any)
url="https://github.com/RaphaelRochet/applications-overview-tooltip"
license=('GPL')
depends=('gnome-shell>=3.38')
conflicts=("${pkgname%-git}")
provides=(${pkgname%-git})
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d3b5646d679025f2e1f60ebf0413dbe0eb5d1f2cd437d45a86375c0002f52dc1')


package() {
  _reponame="applications-overview-tooltip"
  _uuid="applications-overview-tooltip@RaphaelRochet"

  cd "${srcdir}/${_reponame}-${pkgver}"
  local dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  mkdir -p "${dir}"
  cp -R * "${dir}"
}

