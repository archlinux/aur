pkgname=python-langchain
pkgver=0.0.345
pkgrel=1
pkgdesc='⚡ Building applications with LLMs through composability ⚡ '
arch=(x86_64)
url='https://github.com/langchain-ai/langchain'
license=('MIT')
source=("https://github.com/langchain-ai/langchain/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('8d8ffe2af2530043fc6af1393056893e2530436a83295437ada6716a8b0217ffc3a70b4f82eccd72c69eaf6d424d30d0260efe8ad97ae814ecb4258f850d314b')
depends=(python python-aiohttp python-anyio python-dataclasses-json python-jsonpatch python-langchain-core python-langsmith python-numpy python-pydantic python-yaml python-requests python-sqlalchemy python-tenacity)
depends+=(python-chardet yt-dlp python-networkx python-pillow python-tqdm python-pytorch-opt-cuda ipython faiss-cuda python-joblib python-pymysql python-google-auth-oauthlib python-websocket-client python-pydub python-pdfminer python-transformers python-google-auth python-grpcio python-nest-asyncio python-regex python-tokenizers python-pypdfium2 python-tiktoken python-huggingface-hub python-beautifulsoup4 python-openai python-lxml python-tensorflow-opt-cuda python-magic python-jsonschema python-scikit-learn python-protobuf python-pymongo python-lark-parser python-pdfplumber python-nltk python-rapidfuzz python-pypdf2 python-unstructured)
makedepends=('python-build' 'python-installer' 'python-wheel')

build() {
    cd langchain-$pkgver/libs/langchain
    python -m build --wheel --no-isolation
}

package() {
    cd langchain-$pkgver/libs/langchain
    python -m installer --destdir="$pkgdir" dist/*.whl
}
