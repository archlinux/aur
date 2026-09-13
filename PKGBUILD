pkgname=simplelogin-server
pkgver=4.81.7
pkgrel=5
pkgdesc='Self-hosted SimpleLogin email alias server'
arch=('x86_64')
url='https://github.com/simple-login/app'
license=('AGPL-3.0-only')
install='simplelogin-server.install'

_slpgpver=0.1.1

depends=(
  'python'
  'gunicorn'
  'gnupg'
  'python-aiosmtpd'
  'python-aiospamc'
  'python-alembic'
  'python-arrow'
  'python-bcrypt'
  'python-blinker'
  'python-boto3'
  'python-cachetools'
  'python-cbor2'
  'python-click'
  'python-coloredlogs'
  'python-cryptography'
  'python-deprecated'
  'python-dkim'
  'python-dnspython'
  'python-dotenv'
  'python-email-validator'
  'python-flanker'
  'python-flask'
  'python-flask-admin'
  'python-flask-babel'
  'python-flask-cors'
  'python-flask-limiter'
  'python-flask-login'
  'python-flask-migrate'
  'python-flask-profiler'
  'python-flask-wtf'
  'python-gevent'
  'python-gnupg'
  'python-google-api-python-client'
  'python-google-auth-httplib2'
  'python-google-re2'
  'python-itsdangerous'
  'python-jwcrypto'
  'python-limits'
  'python-markupsafe'
  'python-memory-profiler'
  'python-newrelic'
  'python-pgpy'
  'python-phpserialize'
  'python-protobuf'
  'python-psycopg2'
  'python-pycryptodome'
  'python-pyopenssl'
  'python-pyotp'
  'python-pyspf'
  'python-redis'
  'python-requests'
  'python-requests-oauthlib'
  'python-sentry_sdk'
  'python-sqlalchemy'
  'python-sqlalchemy-utils'
  'python-strictyaml'
  'python-tldextract'
  'python-twilio'
  'python-unidecode'
  'python-webauthn'
  'python-werkzeug'
  'python-wtforms'
)

makedepends=(
  'nodejs'
  'npm'
  'python-installer'
)

optdepends=(
  'postgresql: local PostgreSQL database server'
  'postfix: local MTA for inbound and outbound SimpleLogin mail'
  'postfix-pgsql: PostgreSQL-backed Postfix lookup maps'
  'nginx: reverse proxy for the web application'
  'valkey: Redis-compatible session and rate-limit backend'
  'spamassassin: optional spamd backend'
  'ipython: interactive SimpleLogin shell helper'
  'python-flask-debugtoolbar: optional Flask debug toolbar'
  'python-facebook-sdk: optional Facebook authentication support'
)

source=(
  "simplelogin-${pkgver}.tar.gz::https://github.com/simple-login/app/archive/refs/tags/v${pkgver}.tar.gz"
  "sl_pgp-${_slpgpver}-cp310-abi3-manylinux_2_31_x86_64.whl::https://github.com/simple-login/sl-pgp-rs/releases/download/${_slpgpver}/sl_pgp-${_slpgpver}-cp310-abi3-manylinux_2_31_x86_64.whl"
  'sqlalchemy2-legacy-annotations.patch'
  'wtforms3-emailfield.patch'
  'redis-unix-socket.patch'
  'flask3-compat.patch'
  'flask-limiter4-compat.patch'
  'flask-admin2-compat.patch'
  'arrow-api-compat.patch'
  're2-compat.patch'
  'sqlalchemy2-api-compat.patch'
  'email-handler-listen-address.patch'
  'sqlalchemy2-migrations-compat.patch'
  'jwcrypto-api-compat.patch'
  'bcrypt5-compat.patch'
  'webauthn3-compat.patch'
  'werkzeug-user-agent-compat.patch'
  'arch-compat-tests.patch'
  'simplelogin.service'
  'simplelogin-email.service'
  'simplelogin-job-runner.service'
  'simplelogin.sysusers'
  'simplelogin.tmpfiles'
  'simplelogin.env.example'
)

sha256sums=('f52b57dbc5feebe2b5a5244c88fac197638e89b447338cdc173675a6b5eddca2'
            '1cda5d1953388d25641e0383f6dc0630a42f22256aa1da9eafb9979909b71d17'
            '43585103727c465c90c437c167a7f608c6f4daebdb1dff7222a1918cda33e451'
            'cd2b3e5e7583139acb389505947cceb9860acf28c87d1eaef5ee5d5f02a75b18'
            'a6a7d9286762aab73c672bff2c081a047ea0d46204e36e8981abfc3b8e7bf009'
            'fe5fa8d0beecdbfb1359dd900c55d4921377f8701d251a1ffb944c4d24c96f3a'
            '62aa7cf433a75c04459c4e38c6200ae50755b3754c786b3820c2008996248941'
            '2442c5849bcc447275473ad06eecd7212baccb9c35da476913db7e26645f50d7'
            '79b8ba1e448904a8d1bb62addb0d40786f4724e5816f511b0b30c148eebd7d11'
            'cacad537c38d146f3cbc06a8e0b87f4f577e1f5cc880451f8be12df3be691d59'
            '5267684be8a1d14fe3033b39c19c9e2b4936b4bf9e28ce1814c92d75f7cc45c5'
            '5049a47c140d1f3414ba66a2848409103cbd5030d173bf2a0b614bc49123f738'
            '00aad070cf6ab19e3bb556809a5244132ce17ec5eab9b2ced4036b3ed00ceb27'
            '80feb5585a74e704df2c579249b51035e5a5a6c34236a8217eb2127830325798'
            'bd3c35b89dfd1151050da2c8f693b1e7ab5a87870b29f9fae9208cb4676de20b'
            '9894586a36fad9e333bc58aa9885db4436de1665745d35d6b63ad89dedf8211f'
            '67f4d8355ace39cd7babbf36866e3f52c086b8102638fed0c692963b6ee336cf'
            '7bfcc80a2bd87fc33bf94903defbbf52e60f766682d3138baf95994b6048d702'
            '8e5f5fe52d6c72eda036bbc195ccc71140efb7829df7bae11e7667bf772b0061'
            'e6e594c7ca5d46fae0bfec33551741b1e3efe1515c444d7e33395d73bafae65e'
            '37a6a6569c1709c01cfc9026c275c5e468ccb812c12c2877174e365f06e2caa6'
            '5c42c5338fadb4a8be7fe6bf233332831074b27b331681ec95fed2f294d94792'
            '99732b7040b0aae127b0ac12b6b54f9603f59d8bb96130a437b2e93c3a1450a9'
            '73b6f460c478e88197d2c1caa7ca8361afa03a0fcf6118435e644b8360d71aac')

prepare() {
  cd "$srcdir/app-${pkgver}"

  patch --no-backup-if-mismatch -Np1 -i "$srcdir/sqlalchemy2-legacy-annotations.patch"
  patch --no-backup-if-mismatch -Np1 -i "$srcdir/wtforms3-emailfield.patch"
  patch --no-backup-if-mismatch -Np1 -i "$srcdir/redis-unix-socket.patch"
  patch --no-backup-if-mismatch -Np1 -i "$srcdir/flask3-compat.patch"
  patch --no-backup-if-mismatch -Np1 -i "$srcdir/flask-limiter4-compat.patch"
  patch --no-backup-if-mismatch -Np1 -i "$srcdir/flask-admin2-compat.patch"
  patch --no-backup-if-mismatch -Np1 -i "$srcdir/arrow-api-compat.patch"
  patch --no-backup-if-mismatch -Np1 -i "$srcdir/re2-compat.patch"
  patch --no-backup-if-mismatch -Np1 -i "$srcdir/sqlalchemy2-api-compat.patch"
  patch --no-backup-if-mismatch -Np1 -i "$srcdir/email-handler-listen-address.patch"
  patch --no-backup-if-mismatch -Np1 -i "$srcdir/sqlalchemy2-migrations-compat.patch"
  patch --no-backup-if-mismatch -Np1 -i "$srcdir/jwcrypto-api-compat.patch"
  patch --no-backup-if-mismatch -Np1 -i "$srcdir/bcrypt5-compat.patch"
  patch --no-backup-if-mismatch -Np1 -i "$srcdir/webauthn3-compat.patch"
  patch --no-backup-if-mismatch -Np1 -i "$srcdir/werkzeug-user-agent-compat.patch"
  patch --no-backup-if-mismatch -Np1 -i "$srcdir/arch-compat-tests.patch"
}

build() {
  cd "$srcdir/app-${pkgver}/static"

  npm install \
    --ignore-scripts \
    --no-audit \
    --no-fund \
    --package-lock=false
}

package() {
  cd "$srcdir/app-${pkgver}"

  install -d "$pkgdir/usr/lib/simplelogin"
  cp -a . "$pkgdir/usr/lib/simplelogin/"

  rm -rf \
    "$pkgdir/usr/lib/simplelogin/.github" \
    "$pkgdir/usr/lib/simplelogin/tests" \
    "$pkgdir/usr/lib/simplelogin/docs"

  rm -f \
    "$pkgdir/usr/lib/simplelogin/Dockerfile" \
    "$pkgdir/usr/lib/simplelogin/.dockerignore" \
    "$pkgdir/usr/lib/simplelogin/requirements.lock" \
    "$pkgdir/usr/lib/simplelogin/requirements-dev.lock" \
    "$pkgdir/usr/lib/simplelogin/poetry.lock" \
    "$pkgdir/usr/lib/simplelogin/uv.lock"

  rm -rf "$pkgdir/usr/lib/simplelogin/static/upload"
  ln -s /var/lib/simplelogin/upload \
    "$pkgdir/usr/lib/simplelogin/static/upload"

  python -m installer \
    --destdir="$pkgdir" \
    "$srcdir/sl_pgp-${_slpgpver}-cp310-abi3-manylinux_2_31_x86_64.whl"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 example.env \
    "$pkgdir/usr/share/doc/$pkgname/example.env"

  install -Dm640 "$srcdir/simplelogin.env.example" \
    "$pkgdir/etc/simplelogin/simplelogin.env.example"

  install -Dm644 "$srcdir/simplelogin.service" \
    "$pkgdir/usr/lib/systemd/system/simplelogin.service"

  install -Dm644 "$srcdir/simplelogin-email.service" \
    "$pkgdir/usr/lib/systemd/system/simplelogin-email.service"

  install -Dm644 "$srcdir/simplelogin-job-runner.service" \
    "$pkgdir/usr/lib/systemd/system/simplelogin-job-runner.service"

  install -Dm644 "$srcdir/simplelogin.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/simplelogin.conf"

  install -Dm644 "$srcdir/simplelogin.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/simplelogin.conf"
}
