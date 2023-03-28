# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=docker-machine-gitlab-bin
pkgdesc="Docker Machine (GitLab's fork)"
_version="v0.16.2-gitlab.20"
pkgver=$(echo "$_version" | sed -e 's/v//g' -e 's/-gitlab//g')
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h')
url="https://gitlab.com/gitlab-org/ci-cd/docker-machine"
license=('Apache')
conflicts=('docker-machine')
provides=('docker-machine')
source=("$pkgname.LICENSE::https://gitlab.com/gitlab-org/ci-cd/docker-machine/-/raw/${_version}/LICENSE")
source_x86_64=("$pkgname.x86_64::https://gitlab-docker-machine-downloads.s3.amazonaws.com/${_version}/docker-machine-Linux-x86_64")
source_aarch64=("$pkgname.aarch64::https://gitlab-docker-machine-downloads.s3.amazonaws.com/${_version}/docker-machine-Linux-aarch64")
source_armv7h=("$pkgname.armv7h::https://gitlab-docker-machine-downloads.s3.amazonaws.com/${_version}/docker-machine-Linux-armhf")
sha256sums=('552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243')
sha256sums_x86_64=('4eb1bdf119496d35fd6f61be8235343919563ef16865aace390e6837aafee25a')
sha256sums_aarch64=('337b8d552a21f2e55cbcaa7d36504c03bd7e3dc415e78a2b809a4c929f0f6f8d')
sha256sums_armv7h=('c8f31803b0bda88a383883abd5782dbe2c23ce64ea58b9cc05f2a44558b926e6')

package() {
  install -Dm644 "$pkgname.LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "$pkgname.$CARCH" "$pkgdir/usr/bin/docker-machine"
}