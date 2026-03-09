  # Maintainer: Nauris Steins <me@naurissteins.com>
  pkgname=matuwall
  pkgver=0.1.6
  pkgrel=1
  pkgdesc="A minimal GTK4 + libadwaita wallpaper switcher for Wayland"
  arch=('x86_64')
  url="https://github.com/naurissteins/Matuwall"
  license=('GPL-3.0-or-later')
  depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'gtk4-layer-shell')
  makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
  optdepends=('matugen: apply colors' 'awww: apply wallpapers')
  source=("$pkgname-$pkgver.tar.gz::https://github.com/naurissteins/Matuwall/archive/refs/tags/$pkgver.tar.gz")
  sha256sums=('SKIP')

  build() {
    cd "Matuwall-$pkgver"
    python -m build --wheel --no-isolation
  }

  package() {
    cd "Matuwall-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  }
