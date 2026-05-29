package() {
    cd "$srcdir/Hexer"

    install -Dm755 $(find . -name "gui.py" | head -n 1) \
        "$pkgdir/usr/lib/hexer-cli/gui.py"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/hexer-cli" << 'EOF'
#!/usr/bin/env bash
exec python /usr/lib/hexer-cli/gui.py
EOF
}