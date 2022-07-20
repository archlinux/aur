# Maintainer: Thaodan <AUR+me@thaodan.de>

pkgname=obs-service-repo
pkgver=0.13.2
pkgrel=1
pkgdesc="Repo service designed for droid-hal-device builds"
arch=('any')
url="https://github.com/MeeGoIntegration/obs-service-repo"
license=('GPL2')
groups=('obs')
depends=(
  git
  repo
  pbzip2
)

optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/MeeGoIntegration/obs-service-repo/archive/$pkgver.tar.gz")
sha512sums=('d430665404e7f000864c1d224ce30208ce0f60f7b6705dfb159b093a17242d882037473b704ccbb2bedade89f9137ada4c705ecbbe00b1e3dd0e1b57860975a4')


package() {
  cd "$pkgname-$pkgver"
 # mkdir -p ${pkgdir}/etc/cron.d/

  install -Dm755 repo ${pkgdir}/usr/lib/obs/service/repo
  install -m644 repo.service ${pkgdir}/usr/lib/obs/service/repo.service

  #cp repo-service-cronjob ${pkgdir}/usr/lib/obs/service/
  #cp repo.crontab ${pkgdir}/etc/cron.d/
}
