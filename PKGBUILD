# Maintainer: LY <ly-niko@qq.com>

pkgname=shuiyuan-exporter
pkgver=1.0.2
pkgrel=1
pkgdesc="Export posts on Shuiyuan Forum (SJTU) as markdown documents"
arch=('any')
url="https://github.com/Labyrinth0419/shuiyuan_exporter"
license=('MIT')
depends=(
  'python>=3.12'
  'python-requests'
  'python-beautifulsoup4'
  'python-simple-term-menu'
)
optdepends=(
  'python-dumb-menu: Windows-style menu fallback'
)
source=(
  "main.py"
  "constant.py"
  "utils.py"
  "image_handler.py"
  "attachments_handler.py"
  "audio_handler.py"
  "video_handler.py"
  "quality_list.py"
  "LICENSE"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
  local lib_dir="/usr/lib/$pkgname"
  install -Dm644 main.py "$pkgdir$lib_dir/main.py"
  install -Dm644 constant.py "$pkgdir$lib_dir/constant.py"
  install -Dm644 utils.py "$pkgdir$lib_dir/utils.py"
  install -Dm644 image_handler.py "$pkgdir$lib_dir/image_handler.py"
  install -Dm644 attachments_handler.py "$pkgdir$lib_dir/attachments_handler.py"
  install -Dm644 audio_handler.py "$pkgdir$lib_dir/audio_handler.py"
  install -Dm644 video_handler.py "$pkgdir$lib_dir/video_handler.py"
  install -Dm644 quality_list.py "$pkgdir$lib_dir/quality_list.py"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/shuiyuan-exporter" <<'EOF'
#!/bin/sh
exec python /usr/lib/shuiyuan-exporter/main.py "$@"
EOF

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
