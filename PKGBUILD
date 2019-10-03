# Maintainer: Vladislav Petrov <ejiek@mail.ru>

pkgname=gitlab-monitor
pkgver=1.7
pkgrel=1
pkgdesc="A web-based monitor dashboard for GitLab CI"
arch=(any)
url="https://github.com/timoschwarzer/gitlab-monitor"
license=(MIT)
makedepends=(npm nodejs-lts-dubnium git yarn python)
source=(${pkgbase}-${pkgver}.tar.gz::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('4ec412b3dacfb0c9ebe8dd295c3db448a0426ef87f1902dcf9ccf9729a942dfd')

build() {
  cd ${pkgbase}-${pkgver}
  yarn install
  yarn run build
}

package() {
  cd ${pkgbase}-${pkgver}

  install -d "${pkgdir}"/usr/share/webapps/${pkgbase}

  cp -r dist/* "${pkgdir}"/usr/share/webapps/${pkgbase}/
}
