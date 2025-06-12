# Maintainer: Your Name <youremail@example.com>

pkgname=spaces
pkgver=9.2
pkgrel=1
pkgdesc="A CLI tool that helps you open your apps more easily"
arch=('any')
url="https://github.com/simit22/spaces" 
license=('GPL')
depends=('python' 'python-rich')
source=("https://raw.githubusercontent.com/simit22/spaces/main/spaces.py") 
md5sums=('SKIP')

package() {
    # Install the actual script to /bin
    install -Dm644 "$srcdir/spaces.py" "$pkgdir/bin/spaces.py"

    # Create a wrapper script at /bin/spaces that runs it via python
    cat > "$pkgdir/bin/spaces" <<'EOF'
#!/bin/sh
python /bin/spaces.py "$@"
EOF

    chmod +x "$pkgdir/bin/spaces"
}
