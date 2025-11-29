# Maintainer: Your Name <your.email@example.com>

pkgname=wisp-calendar
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern calendar application for Arch Linux"
arch=('any')
url="https://github.com/your-username/wisp-calendar"
license=('MIT')
depends=('bash')
makedepends=()
install="${pkgname}.install"
source=()
sha256sums=()

# Prepare the environment (create the script during build)
prepare() {
    # Create a temporary directory for our files
    mkdir -p "${srcdir}/${pkgname}-${pkgver}"
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Create a simple script placeholder
    cat > wisp-calendar << 'EOF'
#!/bin/bash
echo "========================================="
echo "  Wisp Calendar v0.1.0"
echo "========================================="
echo ""
echo "A modern calendar application for Arch Linux"
echo ""
echo "This is a placeholder. Application coming soon!"
EOF

    # Create a license file
    cat > LICENSE << 'EOF'
MIT License

Copyright (c) 2025 Wisp Calendar

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction.
EOF

    # Create a README
    cat > README.md << 'EOF'
# Wisp Calendar

A modern calendar application for Arch Linux.

## Usage

Run the command:

```bash
wisp-calendar
```

## Built with

- Bash
- Arch Linux PKGBUILD
EOF
}

# No build needed for simple bash scripts
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Nothing to compile
}

# Install the files
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install the executable
    install -Dm755 wisp-calendar "${pkgdir}/usr/bin/wisp-calendar"

    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 et:
