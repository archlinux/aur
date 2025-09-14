# Maintainer: Reza Ygb <reza-ygb@users.noreply.github.com>

pkgname=apex-launcher
# ▼▼▼ فقط این خط را با ورژن Release گیت‌هاب خودت عوض کن ▼▼▼
pkgver=1.0.0
pkgrel=1
pkgdesc="The Fastest, Lightest, Most Reliable Application Launcher for Linux"
arch=('any')
url="https://github.com/reza-ygb/apex-launcher"
license=('MIT')
depends=('python-pyqt5')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('25ad485528f1cc5b814c8f5606ac6868f30acd6b55f06cd45f66a10302e614d0')

# این تابع package جایگزین نسخه قبلی می‌شود
package() {
  cd "$pkgname-$pkgver"

  # 1. اسکریپت اصلی برنامه را به پوشه قابل اجرا کپی می‌کند
  install -Dm755 apex_launcher.py "$pkgdir/usr/bin/apex-launcher"

  # 2. فایل دسکتاپ را برای نمایش در منوی برنامه‌ها کپی می‌کند
  install -Dm644 apex-launcher.desktop "$pkgdir/usr/share/applications/apex-launcher.desktop"

  # 3. آیکون برنامه را کپی می‌کند
  install -Dm644 apex-launcher.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/apex-launcher.png"
}
