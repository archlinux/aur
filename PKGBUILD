# Maintainer: Your Name <youremail@example.com>

pkgname=spaces
pkgver=17
pkgrel=1
pkgdesc="A CLI tool that helps you open your apps more easily"
arch=('any')
url="https://github.com/simit22/spaces" 
license=('GPL')
depends=('python' 'python-rich')
source=("https://raw.githubusercontent.com/simit22/spaces/main/spaces.py") 
md5sums=('SKIP')

package() {
    # Create the necessary bin directory
    install -d "$pkgdir/usr/bin"

    # Install the Python script to /usr/bin
    install -Dm644 "$srcdir/spaces.py" "$pkgdir/usr/bin/spaces.py"

    # Create a wrapper script at /usr/bin/spaces
    cat > "$pkgdir/usr/bin/spaces" <<'EOF'
#!/bin/sh
exec python /usr/bin/spaces.py "$@"
EOF

    # Make the wrapper executable
    chmod +x "$pkgdir/usr/bin/spaces"
}
