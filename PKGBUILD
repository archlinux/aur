# Maintainer: workonfire <kolucki62@gmail.com>

pkgname=yandex-music-download-git
pkgver=r121.9de8e34
pkgrel=1
pkgdesc="Yandex Music downloader"
arch=('any')
url="https://github.com/kaimi-io/yandex-music-download"
license=('MIT')
depends=('perl' 'perl-mozilla-ca' 'perl-file-util' 'perl-mp3-tag' 'perl-getopt-long-descriptive' 'perl-lwp-useragent-cached' 'perl-lwp-protocol-https' 'perl-http-cookies' 'perl-html-html5-entities')
makedepends=('git')
source=("git+https://github.com/kaimi-io/yandex-music-download.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/yandex-music-download"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/yandex-music-download"
  echo "Installing binary as /usr/bin/ya"
  install -Dm755 "src/ya.pl" "$pkgdir/usr/bin/ya"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
