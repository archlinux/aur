# Maintainer: Thomas Letan <lthms@soap.coffee>

pkgname="firefox-slack-policy"
pkgver=1
pkgrel=1
pkgdesc='Teach Firefox how to deal with slack:// URLs'
arch=('any')
license=('MPL-2.0')

package() {
    install -Dm 644 /dev/stdin \
        "${pkgdir}/usr/lib/firefox/distribution/policies.json" <<'EOF'
{
  "policies": {
    "Handlers": {
      "schemes": {
        "slack": {
          "action": "useSystemDefault"
        }
      }
    }
  }
}
EOF
}
