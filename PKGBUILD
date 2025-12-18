pkgname=ollama-gui
pkgver=0.1.0
pkgrel=1
pkgdesc="Native Tk/ttkbootstrap Ollama desktop UI with sessions and auto web search"
arch=('any')
depends=('python' 'tk' 'python-ttkbootstrap')
license=('Apache-2.0')
source=("ollama-gui::git+https://github.com/mehmetbayoglu/Ollama-gui.git")
md5sums=('SKIP')

build() {
  :
}

package() {
  install -Dm755 "$srcdir/ollama-gui" "$pkgdir/usr/bin/ollama-gui"
  install -Dm644 "$srcdir/ollama_gui.py" "$pkgdir/usr/share/ollama-gui/ollama_gui.py"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/ollama-gui/LICENSE"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/ollama-gui.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Ollama GUI
Comment=Native Ollama desktop client
Exec=/usr/bin/ollama-gui
Icon=utilities-terminal
Terminal=false
Categories=Utility;
EOF
}
