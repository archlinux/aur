# Maintainer: goetzc
pkgname=spotifywm-git
pkgver=0.0.1
pkgrel=2
pkgdesc='Makes Spotify more friendly to window managers by settings a class name before opening the window.'
url=https://github.com/dasJ/spotifywm
arch=('i686' 'x86_64')
license=('MIT')
depends=('libx11' 'sh')
source=('spotifywm::git+https://github.com/dasJ/spotifywm/'
        'spotify.sh')
md5sums=('SKIP'
         '8e9bebb59dc39274f0ceb5340272082a')

build() {
  cd spotifywm
  make
}

package() {
  cd spotifywm

  # Library
  install -D "${srcdir}/spotifywm/spotifywm.so" "${pkgdir}"/usr/lib/spotifywm.so

  # Start script
  install -Dm755 "${srcdir}/spotify.sh" "${pkgdir}/usr/local/bin/spotify"
}
