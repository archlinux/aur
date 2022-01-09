# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=docker-machine-gitlab-bin
pkgdesc="Docker Machine (GitLab's fork)"
_gitlabrel="13"
_mainver="0.16.2"
pkgver="${_mainver}.${_gitlabrel}"
_gitlabver="v${_mainver}-gitlab.${_gitlabrel}"
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://gitlab.com/gitlab-org/ci-cd/docker-machine"
license=('Apache')
conflicts=('docker-machine')
provides=('docker-machine')
source=("$pkgname-$pkgver-LICENSE::https://gitlab.com/gitlab-org/ci-cd/docker-machine/-/raw/${_gitlabver}/LICENSE")
source_x86_64=("$pkgname-$pkgver-x86_64::https://gitlab-docker-machine-downloads.s3.amazonaws.com/${_gitlabver}/docker-machine-Linux-x86_64")
source_aarch64=("$pkgname-$pkgver-aarch64::https://gitlab-docker-machine-downloads.s3.amazonaws.com/${_gitlabver}/docker-machine-Linux-aarch64")
sha256sums=('552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243')
sha256sums_x86_64=('a955ac607034303e400c51b73bbb5665700d583a259a76aae72d0140543b9793')
sha256sums_aarch64=('5d7127da56b3092f166863071d79104088ca5fcac78fea54555448ce90c85078')

package() {
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/docker-machine"
}