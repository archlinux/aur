# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=docker-machine-gitlab-bin
pkgdesc="Docker Machine (GitLab's fork)"
_version="v0.16.2-gitlab.21"
pkgver=$(echo "$_version" | sed -e 's/v//g' -e 's/-gitlab//g')
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h')
url="https://gitlab.com/gitlab-org/ci-cd/docker-machine"
license=('Apache')
conflicts=('docker-machine')
provides=('docker-machine')
_source=$pkgname-$_version
source=("$_source.LICENSE::https://gitlab.com/gitlab-org/ci-cd/docker-machine/-/raw/${_version}/LICENSE")
source_x86_64=("$_source-x86_64::https://gitlab-docker-machine-downloads.s3.amazonaws.com/${_version}/docker-machine-Linux-x86_64")
source_aarch64=("$_source-aarch64::https://gitlab-docker-machine-downloads.s3.amazonaws.com/${_version}/docker-machine-Linux-aarch64")
source_armv7h=("$_source-armv7h::https://gitlab-docker-machine-downloads.s3.amazonaws.com/${_version}/docker-machine-Linux-armhf")
sha256sums=('552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243')
sha256sums_x86_64=('a4e9a416f30406772e76c3b9e795121d5a7e677978923f96b7fb72f0d8354740')
sha256sums_aarch64=('124ceefbe1a1eec44eeb932edf9f85dab1e532d449f5e3e236faed5e8b19caba')
sha256sums_armv7h=('445be2dfcb398cc9e3fa5643920dce26905b6fe3b880b07490b160bd1d016084')

package() {
  install -Dm644 "$_source.LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "$_source-$CARCH" "$pkgdir/usr/bin/docker-machine"
}